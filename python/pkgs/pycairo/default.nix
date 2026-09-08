{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  pkg-config,
  cairo,
  meson-python,
}:

buildPythonPackage rec {
  pname = "pycairo";
  version = "1.29.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pygobject";
    repo = "pycairo";
    tag = "v${version}";
    hash = "sha256-fx/C3raSOU+E5vb/Awu3lz5cMpsXaOrl/8rlCR4jp/o=";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ cairo ];
  # Cairo tries to load system fonts by default.
  # It's surfaced as a Cairo "out of memory" error in tests.
  __impureHostDeps = [ "/System/Library/Fonts" ];

  build-system = [ meson-python ];

  pythonImportsCheck = [ "cairo" ];

  meta = {
    description = "Python 3 bindings for cairo";
    homepage = "https://pycairo.readthedocs.io/";
    license = with lib.licenses; [
      lgpl21Only
      mpl11
    ];
    platforms = lib.platforms.unix;
  };
}
