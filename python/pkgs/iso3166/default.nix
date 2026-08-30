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
    hash = "sha256-qJYw1FlhQD9EI3xCRv3U6fkKxHoAqNfO8myItki1C0g=";
  };
  pythonImportsCheck = [ "iso3166" ];

  meta = {
    description = "Self-contained ISO 3166-1 country definitions";
    homepage = "https://github.com/deactivated/python-iso3166";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
