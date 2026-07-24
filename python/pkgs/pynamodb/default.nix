{
  lib,
  blinker,
  botocore,
  buildPythonPackage,
  fetchFromGitHub,
  freezegun,
  pytest-env,
  pytest-mock,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pynamodb";
  version = "6.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pynamodb";
    repo = "PynamoDB";
    tag = version;
    hash = "sha256-i4oxZO3gBVc2PMFSISeytaO8YrzYR9YuUMxrEqrg2c4=";
  };

  build-system = [ setuptools ];

  dependencies = [ botocore ];

  optional-dependencies = {
    signal = [ blinker ];
  };
  pythonImportsCheck = [ "pynamodb" ];
  meta = {
    description = "Interface for Amazon’s DynamoDB";
    longDescription = ''
      DynamoDB is a great NoSQL service provided by Amazon, but the API is
      verbose. PynamoDB presents you with a simple, elegant API.
    '';
    homepage = "http://jlafon.io/pynamodb.html";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
