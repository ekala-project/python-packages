{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  build,
  git,
  packaging,
  setuptools,
}:

buildPythonPackage rec {
  pname = "setuptools-git-versioning";
  version = "3.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dolfinus";
    repo = "setuptools-git-versioning";
    tag = "v${version}";
    hash = "sha256-d6d8taSSAjvirivf1WaEICq0XbrYQzC2LB//LpGpHhI=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'dynamic = ["version"]' 'version = "${version}"'
  '';

  build-system = [
    packaging
    setuptools
  ];

  dependencies = [
    packaging
    setuptools
  ];

  pythonImportsCheck = [ "setuptools_git_versioning" ];

  meta = {
    description = "Use git repo data (latest tag, current commit hash, etc) for building a version number according PEP-440";
    mainProgram = "setuptools-git-versioning";
    homepage = "https://github.com/dolfinus/setuptools-git-versioning";
    license = lib.licenses.mit;
  };
}
