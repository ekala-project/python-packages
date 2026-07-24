{
  lib,
  fetchFromGitHub,
  rustPlatform,
  cacert,
  buildPythonPackage,
  uvloop,
  click,
  setproctitle,
  watchfiles,
  pytest-asyncio,
  python-dotenv,
  websockets,
  httpx,
  sniffio,
  nix-update-script,
}:

buildPythonPackage rec {
  pname = "granian";
  version = "2.7.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "emmett-framework";
    repo = "granian";
    tag = "v${version}";
    hash = "sha256-SYbdLrE/LaPGpzsrW4FBWtKyTM1VTqJ6sWRVbLjvCM8=";
  };

  # Granian forces a custom allocator for all the things it runs,
  # which breaks some libraries in funny ways. Make it not do that,
  # and allow the final application to make the allocator decision
  # via LD_PRELOAD or similar.
  patches = [
    ./no-alloc.patch # with --unified=1 context
  ];

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit pname version src;
    hash = "sha256-DZZUWpTsKkJQ8ku1Hm5eKFNxhYVfxv7D2N9DLPS9+a4=";
  };

  nativeBuildInputs = with rustPlatform; [
    cargoSetupHook
    maturinBuildHook
  ];

  dependencies = [
    click
  ];

  optional-dependencies = {
    dotenv = [ python-dotenv ];
    pname = [ setproctitle ];
    reload = [ watchfiles ];
    # rloop = [ rloop ]; # not packaged
    uvloop = [ uvloop ];
  };
  # needed for checks
  env.SSL_CERT_FILE = "${cacert}/etc/ssl/certs/ca-bundle.crt";
  # This is a measure of last resort. Granian tests fully lock up
  # on shutdown in >90% of cases, which makes the whole thing
  # impossible to build without restarting it double digits
  # numbers of times. The issue has not been fully identified,
  # and upstream claims it does not exist.
  # FIXME: root cause and fix this.
  doCheck = false;

  pythonImportsCheck = [ "granian" ];

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Rust HTTP server for Python ASGI/WSGI/RSGI applications";
    homepage = "https://github.com/emmett-framework/granian";
    license = lib.licenses.bsd3;
    mainProgram = "granian";
    maintainers = [ ];
    platforms = lib.platforms.unix;
  };
}
