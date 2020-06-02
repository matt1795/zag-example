const std = @import("std");
const clap = @import("clap");
const test_lib = @import("test_lib");

const debug = std.debug;

pub fn main() anyerror!void {
    // First we specify what parameters our program can take.
    // We can use `parseParam` to parse a string to a `Param(Help)`
    const params = comptime [_]clap.Param(clap.Help){
        clap.parseParam("-a <A>") catch unreachable,
        clap.parseParam("-b <B>") catch unreachable,
    };

    var args = try clap.parse(clap.Help, &params, std.heap.page_allocator);
    defer args.deinit();

    if (args.option("-a") == null) {
        debug.warn("missing '-a' argument\n", .{});
        std.process.exit(1);
    }

    if (args.option("-b") == null) {
        debug.warn("missing '-b' argument\n", .{});
        std.process.exit(1);
    }

    debug.warn("{}\n", .{try test_lib.concat(
        std.heap.page_allocator,
        args.option("-a").?,
        args.option("-b").?,
    )});
}
