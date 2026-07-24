{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "immutables";
  version = "0.21";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "MagicStack";
    repo = "immutables";
    tag = "v${version}";
    hash = "sha256-wZuCZEVXzycqA/h27RIe59e2QQALem8mfb3EdjwQr9w=";
  };

  postPatch = ''
    rm tests/conftest.py
  '';

  build-system = [ setuptools ];
  pythonImportsCheck = [ "immutables" ];

  meta = {
    description = "Immutable mapping type";
    homepage = "https://github.com/MagicStack/immutables";
    license = lib.licenses.asl20;
  };
}
