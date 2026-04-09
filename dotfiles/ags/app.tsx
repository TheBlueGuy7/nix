import app from "ags/gtk4/app"
import GLib from "gi://GLib"
import Astal from "gi://Astal?version=4.0"
import Gtk from "gi://Gtk?version=4.0"
import Gdk from "gi://Gdk?version=4.0"
import AstalHyprland from "gi://AstalHyprland"
import AstalWp from "gi://AstalWp"
import AstalNetwork from "gi://AstalNetwork"
import AstalTray from "gi://AstalTray"
import { For, createBinding, onCleanup } from "ags"
import { createPoll } from "ags/time"
import { execAsync } from "ags/process"
import style from "./style.css"

// ── Workspaces ────────────────────────────────────────
function Workspaces() {
    const hypr = AstalHyprland.get_default()
    const workspaces = createBinding(hypr, "workspaces")
    const focused = createBinding(hypr, "focusedWorkspace")

    return (
        <box class="workspaces">
            <For each={workspaces((ws) =>
                ws.sort((a, b) => a.id - b.id).filter((w) => w.id > 0)
            )}>
                {(ws) => (
                    <button
                        class={focused((fw) =>
                            fw.id === ws.id
                                ? "workspace-btn focused"
                                : "workspace-btn"
                        )}
                        onClicked={() => ws.focus()}
                    >
                        <label label={`${ws.id}`} />
                    </button>
                )}
            </For>
        </box>
    )
}

// ── Clock ─────────────────────────────────────────────
function Clock() {
    const time = createPoll("", 1000, () =>
        GLib.DateTime.new_now_local().format("%H:%M  %a %b %d")!
    )

    return (
        <menubutton class="clock">
            <label label={time} />
            <popover>
                <Gtk.Calendar />
            </popover>
        </menubutton>
    )
}

// ── Audio control with popup mixer ────────────────────
function AudioControl() {
    const wp = AstalWp.get_default()!
    const speaker = wp.defaultSpeaker!

    return (
        <menubutton class="volume-btn">
            <box spacing={5}>
                <image iconName={createBinding(speaker, "volumeIcon")} />
                <label label={createBinding(speaker, "volume")(
                    (v) => `${Math.round(v * 100)}%`
                )} />
            </box>
            <popover>
                <box
                    orientation={Gtk.Orientation.VERTICAL}
                    spacing={10}
                    class="audio-popup"
                >
                    <label label="Volume" class="popup-title" xalign={0} />
                    <box spacing={8} class="main-volume-row">
                        <button
                            class="mute-btn"
                            onClicked={() => {
                                speaker.mute = !speaker.mute
                            }}
                        >
                            <image
                                iconName={createBinding(speaker, "volumeIcon")}
                                pixelSize={20}
                            />
                        </button>
                        <slider
                            hexpand
                            widthRequest={220}
                            value={createBinding(speaker, "volume")}
                            onChangeValue={({ value }) =>
                                speaker.set_volume(value)
                            }
                        />
                        <label
                            class="popup-volume-label"
                            label={createBinding(speaker, "volume")(
                                (v) => `${Math.round(v * 100)}%`
                            )}
                        />
                    </box>
                    <Gtk.Separator />
                    <label
                        label="Applications"
                        class="popup-title"
                        xalign={0}
                    />
                    <box
                        orientation={Gtk.Orientation.VERTICAL}
                        class="app-mixer"
                    >
                        <For each={createBinding(wp.audio, "streams")}>
                            {(stream) => (
                                <box spacing={8} class="app-mixer-item">
                                    <image
                                        iconName={createBinding(
                                            stream,
                                            "icon",
                                        )((i) =>
                                            i || "audio-x-generic-symbolic"
                                        )}
                                        pixelSize={18}
                                    />
                                    <label
                                        label={createBinding(
                                            stream,
                                            "name",
                                        )((n) => n || "Unknown")}
                                        xalign={0}
                                        ellipsize={3}
                                        maxWidthChars={16}
                                    />
                                    <slider
                                        hexpand
                                        class="app-slider"
                                        value={createBinding(
                                            stream,
                                            "volume",
                                        )}
                                        onChangeValue={({ value }) =>
                                            stream.set_volume(value)
                                        }
                                    />
                                    <label
                                        class="app-volume-pct"
                                        label={createBinding(
                                            stream,
                                            "volume",
                                        )(
                                            (v) =>
                                                `${Math.round(v * 100)}%`,
                                        )}
                                    />
                                </box>
                            )}
                        </For>
                    </box>
                </box>
            </popover>
        </menubutton>
    )
}

// ── Network ───────────────────────────────────────────
function NetworkIndicator() {
    const network = AstalNetwork.get_default()
    const wifi = network.wifi
    const wired = network.wired
    const primary = createBinding(network, "primary")

    return (
        <box class="network" spacing={5}>
            {wifi && (
                <box
                    visible={primary(
                        (p) => p === AstalNetwork.Primary.WIFI,
                    )}
                    spacing={5}
                >
                    <image iconName={createBinding(wifi, "iconName")} />
                    <label
                        label={createBinding(wifi, "ssid")(
                            (s) => s || "",
                        )}
                    />
                </box>
            )}
            {wired && (
                <image
                    visible={primary(
                        (p) => p === AstalNetwork.Primary.WIRED,
                    )}
                    iconName={createBinding(wired, "iconName")}
                />
            )}
        </box>
    )
}

// ── System monitor ────────────────────────────────────
function SysMon() {
    const cpu = createPoll("0", 3000, [
        "bash",
        "-c",
        "vmstat 1 2 | tail -1 | awk '{print 100-$15}'",
    ])

    const mem = createPoll("", 5000, [
        "bash",
        "-c",
        "free -h | awk '/Mem:/ {printf \"%s/%s\", $3, $2}'",
    ])

    return (
        <button
            class="sysmon"
            onClicked={() => execAsync(["alacritty", "-e", "btop"])}
        >
            <box spacing={8}>
                <label label={cpu((v) => `CPU ${v}%`)} />
                <label class="sysmon-sep" label="|" />
                <label label={mem((v) => `MEM ${v}`)} />
            </box>
        </button>
    )
}

// ── System tray ───────────────────────────────────────
function Tray() {
    const tray = AstalTray.get_default()
    const items = createBinding(tray, "items")

    const init = (btn: Gtk.MenuButton, item: AstalTray.TrayItem) => {
        btn.menuModel = item.menuModel
        btn.insert_action_group("dbusmenu", item.actionGroup)
        item.connect("notify::action-group", () => {
            btn.insert_action_group("dbusmenu", item.actionGroup)
        })
    }

    return (
        <box class="tray">
            <For each={items}>
                {(item) => (
                    <menubutton $={(self) => init(self, item)}>
                        <image
                            gicon={createBinding(item, "gicon")}
                            pixelSize={16}
                        />
                    </menubutton>
                )}
            </For>
        </box>
    )
}

// ── Bar ───────────────────────────────────────────────
function Bar({ gdkmonitor }: { gdkmonitor: Gdk.Monitor }) {
    let win: Astal.Window
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

    onCleanup(() => win.destroy())

    return (
        <window
            $={(self) => (win = self)}
            visible
            gdkmonitor={gdkmonitor}
            exclusivity={Astal.Exclusivity.EXCLUSIVE}
            anchor={TOP | LEFT | RIGHT}
            marginTop={4}
            marginLeft={5}
            marginRight={5}
            application={app}
        >
            <centerbox class="bar">
                <box $type="start">
                    <Workspaces />
                </box>
                <box $type="center">
                    <Clock />
                </box>
                <box $type="end" spacing={8}>
                    <SysMon />
                    <NetworkIndicator />
                    <AudioControl />
                    <Tray />
                </box>
            </centerbox>
        </window>
    )
}

// ── App entry ─────────────────────────────────────────
app.start({
    css: style,
    main() {
        for (const monitor of app.get_monitors()) {
            Bar({ gdkmonitor: monitor })
        }
    },
})
