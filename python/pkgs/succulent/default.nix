{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flask,
  lxml,
  numpy,
  pandas,
  pyyaml,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "succulent";
  version = "0.4.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "firefly-cpp";
    repo = "succulent";
    tag = version;
    hash = "sha256-rZNBe6l6rFaaiwhFB4nqS8D6N0uSPdqNgufsSyLNf2g=";
  };

  pythonRelaxDeps = [
    "flask"
    "lxml"
    "numpy"
    "pandas"
  ];

  build-system = [
    poetry-core
  ];

  dependencies = [
    flask
    lxml
    numpy
    pandas
    pyyaml
  ];

  pythonImportsCheck = [ "succulent" ];

  meta = {
    description = "Collect POST requests";
    homepage = "https://github.com/firefly-cpp/succulent";
    license = lib.licenses.mit;
  };
}
