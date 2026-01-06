{
  # Editor settings
  "editor.fontFamily" = "'FiraCode Nerd Font', 'Fira Code', monospace";
  "editor.fontLigatures" = true;
  "editor.lineNumbers" = "relative";
  "editor.cursorSurroundingLines" = 8;
  # "editor.minimap.enabled" = false;
  "editor.renderWhitespace" = "selection";

  # Workbench appearance
  "workbench.colorTheme" = "Visual Studio Dark";
  "workbench.startupEditor" = "none";
  "workbench.statusBar.visible" = false;
  "workbench.navigationControl.enabled" = false;
  "workbench.layoutControl.enabled" = false;
  "breadcrumbs.enabled" = false;

  # File associations
  "workbench.editorAssociations" = {
    "*.md" = "vscode.markdown.preview.editor";
  };

  # File management
  # "files.autoSave" = "onFocusChange";
  "files.trimTrailingWhitespace" = true;
  "files.insertFinalNewline" = true;
  "files.exclude" = {
    "**/.git" = true;
    "**/.DS_Store" = true;
    "**/node_modules" = true;
    "**/__pycache__" = true;
    "**/.pytest_cache" = true;
  };
  "search.exclude" = {
    "**/node_modules" = true;
    "**/dist" = true;
    "**/build" = true;
    "**/.git" = true;
  };

  # Git settings
  "git.autofetch" = true;
  "git.confirmSync" = false;
  "git.decorations.enabled" = true;
  # "git.enableSmartCommit" = true;
  "scm.diffDecorations" = "gutter";
  "diffEditor.ignoreTrimWhitespace" = false;
  "merge-conflict.autoNavigateNextConflict.enabled" = true;

  # GitLens settings
  "gitlens.currentLine.enabled" = true;
  "gitlens.hovers.currentLine.over" = "line";
  "gitlens.codeLens.enabled" = false;
  "gitlens.graph.layout" = "editor";

  # Vim settings
  "vim.leader" = "<space>";
  "vim.easymotion" = true;
  "vim.easymotionKeys" = "hklyuiopnm,qwertzxcvbasdgjf;";
  "vim.useSystemClipboard" = true;
  "vim.highlightedyank.enable" = true;

  # Extension settings
  "claudeCode.preferredLocation" = "sidebar";

  # Telemetry & privacy
  "telemetry.telemetryLevel" = "off";
  "update.showReleaseNotes" = false;
}
