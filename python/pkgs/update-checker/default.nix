{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "update-checker";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    pname = "update_checker";
    inherit (finalAttrs) version;
    sha256 = "sha256-1yqHUfNmZJdKiyudhwgO/cBWLF7AfqpzzRk3xphX25g=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'requires = ["uv_build>=0.8.0,<1.0"]' 'requires = ["setuptools"]' \
      --replace-fail 'build-backend = "uv_build"' 'build-backend = "setuptools.build_meta"'
  '';

  build-system = [ setuptools ];

  # requires network

  pythonImportsCheck = [ "update_checker" ];

  meta = {
    description = "Python module that will check for package updates";
    homepage = "https://github.com/bboe/update_checker";
    license = lib.licenses.bsd2;
  };
})
