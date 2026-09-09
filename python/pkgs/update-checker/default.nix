{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "update-checker";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "update_checker";
    inherit version;
    sha256 = "sha256-v8rGZBRXKoKpjqjIYzvxzl0QJ1DjuTRpuJswqoRc0dc=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'requires = ["uv_build>=0.8.0,<1.0"]' 'requires = ["setuptools"]' \
      --replace-fail 'build-backend = "uv_build"' 'build-backend = "setuptools.build_meta"'
  '';

  build-system = [ setuptools ];

  # requires network
  doCheck = false;

  pythonImportsCheck = [ "update_checker" ];

  meta = {
    description = "Python module that will check for package updates";
    homepage = "https://github.com/bboe/update_checker";
    license = lib.licenses.bsd2;
  };
}
