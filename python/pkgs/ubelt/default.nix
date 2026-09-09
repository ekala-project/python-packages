{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  wheel,
  numpy,
  python-dateutil,
  xxhash,
  requests,
  xdoctest,
}:

buildPythonPackage rec {
  pname = "ubelt";
  version = "1.4.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Erotemic";
    repo = "ubelt";
    tag = "v${version}";
    hash = "sha256-LCewB9K4nGw/uyGK35mcesJYXju2N0FsdLW1XkPLD+I=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  optional-dependencies = {
    optional = [
      numpy
      python-dateutil
      xxhash
    ];
  };
  disabledTests = lib.optionals stdenv.hostPlatform.isDarwin [
    # fail due to sandbox environment
    "CacheStamp.expired"
    "userhome"
  ];

  pythonImportsCheck = [ "ubelt" ];
  meta = {
    description = "Python utility library with a stdlib like feel and extra batteries. Paths, Progress, Dicts, Downloads, Caching, Hashing: ubelt makes it easy";
    homepage = "https://github.com/Erotemic/ubelt";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
