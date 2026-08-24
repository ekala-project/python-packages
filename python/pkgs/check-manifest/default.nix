{ lib
, build
, buildPythonPackage
, fetchFromGitHub
, pep517
, setuptools
,
}:

buildPythonPackage rec {
  pname = "check-manifest";
  version = "0.51";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mgedmin";
    repo = "check-manifest";
    tag = version;
    hash = "sha256-tT6xQZwqJIsyrO9BjWweIeNgYaopziewerVBk0mFVYg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    build
    pep517
    setuptools
  ];

  pythonImportsCheck = [ "check_manifest" ];

  meta = {
    description = "Check MANIFEST.in in a Python source package for completeness";
    homepage = "https://github.com/mgedmin/check-manifest";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "check-manifest";
  };
}
