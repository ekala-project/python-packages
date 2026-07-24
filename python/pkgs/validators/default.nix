{
  lib,
  buildPythonPackage,
  eth-hash,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "validators";
  version = "0.35.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-validators";
    repo = "validators";
    tag = version;
    hash = "sha256-b3kjKbqmfny6YnU0rlrralTgvYT06sUpckI4EDKDleA=";
  };

  build-system = [ setuptools ];

  optional-dependencies = {
    crypto-eth-addresses = [ eth-hash ] ++ eth-hash.optional-dependencies.pycryptodome;
  };
  meta = {
    description = "Python Data Validation for Humans";
    homepage = "https://github.com/python-validators/validators";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
