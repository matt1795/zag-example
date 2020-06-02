const zag = @import("zag");

pub const clap = zag.import.git(
    "https://github.com/Hejsil/zig-clap.git",
    "master",
    "clap.zig",
);

pub const test_lib = zag.import.git(
    "https://github.com/matt1795/concat.git",
    "master",
    null,
);
