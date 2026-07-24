{
  lib,
  buildPythonPackage,
  distutils,
  fetchFromGitHub,
  passlib,
  pip,
  pythonOlder,
  setuptools,
  twine,
  watchdog,
  webtest,
  build,
  importlib-resources,
}:

buildPythonPackage rec {
  pname = "pypiserver";
  version = "2.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pypiserver";
    repo = "pypiserver";
    tag = "v${version}";
    hash = "sha256-nqoAT3g32srJ0c3sGNFQBznLsnymDPUfL7kcON+BP0k=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace-fail '"setuptools-git>=0.3",' ""
  '';

  build-system = [
    setuptools
  ];

  dependencies = [
    distutils
    pip
  ]
  ++ lib.optionals (pythonOlder "3.12") [ importlib-resources ];

  optional-dependencies = {
    passlib = [ passlib ];
    cache = [ watchdog ];
  };
  pythonImportsCheck = [ "pypiserver" ];

  meta = {
    description = "Minimal PyPI server for use with pip/easy_install";
    homepage = "https://github.com/pypiserver/pypiserver";
    license = with lib.licenses; [
      mit
      zlib
    ];
    maintainers = [ ];
    mainProgram = "pypi-server";
  };
}
