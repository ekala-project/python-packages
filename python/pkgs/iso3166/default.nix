{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
}:

buildPythonPackage rec {
  pname = "iso3166";
  version = "2.1.1";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "deactivated";
    repo = "python-iso3166";
    tag = "v${version}";
    hash = "sha256-/y7c2qSA6+WKUP9YTSaMBjBxtqAuF4nB3MKvL5P6vL0=";
  };
  pythonImportsCheck = [ "iso3166" ];

  meta = {
    description = "Self-contained ISO 3166-1 country definitions";
    homepage = "https://github.com/deactivated/python-iso3166";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
