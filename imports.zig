const zkg = @import("zkg");

pub const clap = zkg.import.git(
    "https://github.com/Hejsil/zig-clap.git",
    "master",
    "clap.zig",
);

pub const regex = zkg.import.git(
    "https://github.com/alexnask/ctregex.zig.git",
    "master",
    "ctregex.zig",
);
