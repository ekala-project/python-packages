{
  pkgs,
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
  pillow,
  pytest-cov-stub,
}:

buildPythonPackage (finalAttrs: {
  pname = "pydyf";
  version = "0.13.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-PBvVNscWHZ9HK4KoqqJ9M1mpBY7BLeFTAtkrNpDa5/U=";
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
  };
})
