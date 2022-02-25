const std = @import("std");
const expect = @import("std").testing.expect;

pub fn main() anyerror!void {
    std.log.info("All your codebase are belong to us.", .{});
}

fn addFive(x: u32) u32 {
    return x + 5;
}

fn fibb(n: u16) u16 {
    if (n == 0 or n == 1) return n;
    return fibb(n - 1) + fibb(n - 2);
}

test "basic test" {
    try std.testing.expectEqual(10, 3 + 7);
}

test "addFive" {
    const y = addFive(0);
    try expect(@TypeOf(y) == u32);
    try expect(y == 5);
}

test "function recursion" {
    const x = fibb(10);
    try expect(x == 55);
}

test "defer" {
    var x: i16 = 5;
    {
        defer x += 2;
        try expect(x==5);
    }
    try expect(x == 7);
}

test "defer multiple" {
    var x: f32 = 5;
    {
        defer x += 2;
        defer x /= 2;
    }

    try expect(x == 4.5);
}


test "var assignment" {
    const constss: i32 = 5;
    var varr: u32 = 5000;

    const consttt = @as(i32, 5);
    const barrrrr = @as(u32, 5000);

    try expect(constss == 5);
    try expect(consttt == 5);
    try expect(varr  == 5000);
    try expect(barrrrr  == 5000);
}

test "arrays" {
    const a = [5]u8{'h', 'e', 'l', 'l', 'o'};
    const b = [_]u8{'w', 'o', 'r', 'l', 'd'};

    try expect(a.len == 5);
    try expect(b.len == 5);
}


test "if" {
    const a = true;
    var x: u16 = 0;
    if (a) {
        x += 1;
    } else {
        x += 2;
    }
    try expect(x == 1);
}

test "if expression" {
    const a = true;
    var x: u16 = 0;
    x += if (a) 1 else 2;
    try expect(x == 1);
}

test "while" {
    var i: u8 = 2;
    while (i < 100) {
        i *= 2;
    }
    try expect(i == 128);
}

test "while with continue expression" {
    var sum: u8 = 0;
    var i: u8 = 1;
    while (i <= 10) : (i += 1) {
        sum += i;
    }
    try expect(sum == 55);
}

test "while with continue" {
    var sum: u8 = 0;
    var i: u8 = 0;
    while (i <= 3) : (i += 1) {
        if (i == 2) continue;
        sum += i;
    }
    try expect(sum == 4);
}

test "while with break" {
    var sum: u8 = 0;
    var i: u8 = 0;
    while (i <= 3) : (i += 1) {
        if (i == 2) break;
        sum += i;
    }
    try expect(sum == 1);
}
