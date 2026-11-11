{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pythonAtLeast,
  pythonOlder,
  # build-system
  hatchling,
  # dependencies
  defusedxml,
  importlib-resources,
  legacy-cgi,
  packaging,
  pip,
  # optional-dependencies
  passlib,
  watchdog,
}:

buildPythonPackage (finalAttrs: {
  pname = "pypiserver";
  version = "2.4.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pypiserver";
    repo = "pypiserver";
    tag = "v${finalAttrs.version}";
    hash = "sha256-uVCFk5He8qadiMVPNrJObaeEIG+rS+h/PGrCBYeM6G8=";
  };

  build-system = [ hatchling ];

  dependencies = [
    defusedxml
    packaging
    pip
  ]
  ++ lib.optionals (pythonOlder "3.12") [ importlib-resources ]
  ++ lib.optionals (pythonAtLeast "3.13") [ legacy-cgi ];

  optional-dependencies = {
    passlib = [ passlib ];
    cache = [ watchdog ];
  };

  pythonImportsCheck = [ "pypiserver" ];

  meta = {
    description = "Minimal PyPI server for use with pip/easy_install";
    homepage = "https://github.com/pypiserver/pypiserver";
    changelog = "https://github.com/pypiserver/pypiserver/blob/v${finalAttrs.version}/CHANGES.rst";
    license = with lib.licenses; [
      mit
      zlib
    ];
    mainProgram = "pypi-server";
  };
})
