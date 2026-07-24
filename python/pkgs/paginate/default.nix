{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pythonAtLeast,

  # build-system
  setuptools,

  # tests
}:

buildPythonPackage rec {
  pname = "paginate";
  version = "0.5.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Pylons";
    repo = "paginate";
    rev = version;
    hash = "sha256-+zX9uGNWcV4BWbD2lcd1u9zZ4m7CnbsYZnc99HNaF8I=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "paginate" ];
  disabledTests = lib.optionals (pythonAtLeast "3.12") [
    # https://github.com/Pylons/paginate/issues/19
    "test_wrong_collection"
    "test_unsliceable_sequence3"
  ];

  meta = {
    description = "Python pagination module";
    homepage = "https://github.com/Pylons/paginate";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
