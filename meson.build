project('com.github.alexkdeveloper.sudoku', ['vala', 'c'],
    version: '1.0.0'
)

gnome = import('gnome')
i18n = import('i18n')

add_global_arguments('-DGETTEXT_PACKAGE="@0@"'.format (meson.project_name()), language:'c')

conf = configuration_data()
# Get the package data directory under Meson
pkgdatadir = join_paths([ get_option('prefix'),
                          get_option('datadir'),
                          meson.project_name() ])

conf.set_quoted('PKGDATADIR', pkgdatadir)

# Other configs
conf.set_quoted('GETTEXT_PACKAGE', meson.project_name())
conf
add_global_arguments('-DDATADIR="' + get_option('datadir') + '"', language: 'c')
configure_file(output: 'config.h', configuration: conf)
config_h_dir = include_directories('.')

# Arguments for C
c_args = [
  '-include', 'config.h',
  '-w'
]

executable(
    meson.project_name(),
    'src/Application.vala',
    'src/Constants.vala',
    'src/MainWindow.vala',
    'src/Board.vala',
    'src/HeaderBar.vala',
    'src/StackManager.vala',
    'src/WinPage.vala',
    'src/views/WelcomeView.vala',
    'src/views/DifficultyView.vala',
    'src/views/GameView.vala',
    'src/logic/Difficulty.vala',
    'src/logic/SudokuBoard.vala',
    'src/logic/SudokuSettings.vala',
    c_args: c_args,
    dependencies: [
        dependency('glib-2.0'),
        dependency('gio-2.0'),
        dependency('gio-unix-2.0'),
        dependency('gobject-2.0'),
        dependency('gtk+-3.0'),
        dependency('granite')
    ],
    install : true
)

subdir('data')

meson.add_install_script('meson/post_install.py')
