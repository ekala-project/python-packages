{
  pkgs,
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
  pillow,
  pytest-cov-stub,
}:

buildPythonPackage rec {
  pname = "pydyf";
  version = "0.12.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-+9fnWVQaxyXCnFBmEgA945Mkm5QxDqeK5Eyx0EsiAJU=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace "--isort --flake8" ""
  '';

  nativeBuildInputs = [ flit-core ];
  pythonImportsCheck = [ "pydyf" ];

  meta = {
    description = "Low-level PDF generator written in Python and based on PDF specification 1.7";
    homepage = "https://doc.courtbouillon.org/pydyf/stable/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
