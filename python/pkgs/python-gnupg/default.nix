{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-gnupg";
  version = "0.5.7";
  pyproject = true;

  src = fetchPypi {
    pname = "python_gnupg";
    inherit (finalAttrs) version;
    hash = "sha256-c+pGIZ+ZKzYesc5UywloEBZwZURUkWo+5d+Lub8MyMw=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"setuptools >= 68,<75"' '"setuptools >= 68"'
  '';

  build-system = [ setuptools ];

  pythonImportsCheck = [ "gnupg" ];

  meta = {
    homepage = "https://github.com/vsajip/python-gnupg";
    description = "API for the GNU Privacy Guard (GnuPG)";
    license = lib.licenses.bsd3;
  };
})
