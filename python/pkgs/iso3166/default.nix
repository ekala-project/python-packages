{
  lib,
  fetchFromGitHub,
  # build-system
  setuptools,
  buildPythonPackage,
}:

buildPythonPackage (finalAttrs: {
  pname = "iso3166";
  version = "2.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "deactivated";
    repo = "python-iso3166";
    tag = "v${finalAttrs.version}";
    hash = "sha256-qJYw1FlhQD9EI3xCRv3U6fkKxHoAqNfO8myItki1C0g=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "iso3166" ];

  meta = {
    description = "Self-contained ISO 3166-1 country definitions";
    homepage = "https://github.com/deactivated/python-iso3166";
    license = lib.licenses.mit;
  };
})
