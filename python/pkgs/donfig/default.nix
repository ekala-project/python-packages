{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  versioneer,
  pyyaml,
  cloudpickle,
}:

buildPythonPackage rec {
  pname = "donfig";
  version = "0.8.1.post1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pytroll";
    repo = "donfig";
    rev = "v${version}";
    hash = "sha256-hF4hzI1MTLgUexRIqwBEEEMV7Az2oDkp5GQQ5282vwE=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "versioneer[toml]==0.28" versioneer
  '';

  build-system = [
    setuptools
    versioneer
  ];

  dependencies = [
    pyyaml
  ];
  pythonImportsCheck = [
    "donfig"
  ];

  meta = {
    description = "Python library for configuring a package including defaults, env variable loading, and yaml loading";
    homepage = "https://github.com/pytroll/donfig";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
