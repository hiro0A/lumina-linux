for (const existingPanel of panels()) {
    existingPanel.remove();
}

const topPanel = new Panel;
topPanel.location = "top";
topPanel.height = 32;
topPanel.lengthMode = "fill";
topPanel.hiding = "none";
topPanel.floating = false;
topPanel.opacity = "translucent";

const launcher = topPanel.addWidget("org.kde.plasma.kicker");
launcher.currentConfigGroup = ["General"];
launcher.writeConfig("icon", "start-here-kde");

topPanel.addWidget("org.kde.plasma.appmenu");
topPanel.addWidget("org.kde.plasma.panelspacer");
topPanel.addWidget("org.kde.plasma.systemtray");

const clock = topPanel.addWidget("org.kde.plasma.digitalclock");
clock.currentConfigGroup = ["Appearance"];
clock.writeConfig("showDate", true);
clock.writeConfig("dateDisplayFormat", "BesideTime");

const dock = new Panel;
dock.location = "bottom";
dock.height = 58;
dock.lengthMode = "fit";
dock.minimumLength = 420;
dock.maximumLength = 920;
dock.alignment = "center";
dock.hiding = "none";
dock.floating = true;
dock.floatingApplets = true;
dock.opacity = "translucent";

const tasks = dock.addWidget("org.kde.plasma.icontasks");
tasks.currentConfigGroup = ["General"];
tasks.writeConfig("launchers", [
    "applications:org.kde.dolphin.desktop",
    "applications:com.google.Chrome.desktop",
    "applications:com.jetbrains.PyCharm-Professional.desktop",
    "applications:org.kde.konsole.desktop",
    "applications:steam.desktop",
    "applications:systemsettings.desktop"
].join(","));
tasks.writeConfig("showOnlyCurrentDesktop", false);
tasks.writeConfig("showOnlyCurrentActivity", true);
tasks.writeConfig("showOnlyCurrentScreen", false);

dock.addWidget("org.kde.plasma.marginsseparator");
dock.addWidget("org.kde.plasma.trash");
dock.addWidget("org.kde.plasma.showdesktop");

for (const desktop of desktopsForActivity(currentActivity())) {
    desktop.wallpaperPlugin = "org.kde.image";
}
