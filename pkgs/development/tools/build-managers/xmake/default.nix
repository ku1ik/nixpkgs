{ lib
, stdenv
, fetchurl
, pkg-config
, lua
, readline
, ncurses
, lz4
, tbox
, xmake-core-sv
}:

stdenv.mkDerivation rec {
  pname = "xmake";
  version = "2.8.3";

  src = fetchurl {
    url = "https://github.com/xmake-io/xmake/releases/download/v${version}/xmake-v${version}.tar.gz";
    hash = "sha256-BC6RazVbT1sr4RLQ1ZR4hHZGXDqFSvuqpt5vPyMDylA=";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    lua
    lua.pkgs.cjson
    readline
    ncurses
    lz4
    tbox
    xmake-core-sv
  ];

  strictDeps = true;

  configureFlags = [ "--external=y" ];

  meta = with lib; {
    description = "A cross-platform build utility based on Lua";
    homepage = "https://xmake.io";
    license = licenses.asl20;
    platforms = lua.meta.platforms;
    maintainers = with maintainers; [ rewine ];
  };
}

