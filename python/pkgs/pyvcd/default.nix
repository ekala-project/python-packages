{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyvcd";
  version = "0.5.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-zSmPXZA4qMuYvUrdvXtFk1Y+MgEElX5wXelJuZOO1/c=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'requires = ["uv_build>=0.9.13,<1.0"]' 'requires = ["setuptools", "setuptools-scm"]' \
      --replace-fail 'build-backend = "uv_build"' 'build-backend = "setuptools.build_meta"'
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ ];

  pythonImportsCheck = [ "vcd" ];

  meta = {
    description = "Python package for writing Value Change Dump (VCD) files";
    homepage = "https://github.com/SanDisk-Open-Source/pyvcd";
    changelog = "https://github.com/SanDisk-Open-Source/pyvcd/blob/${finalAttrs.version}/CHANGELOG.rst";
    license = lib.licenses.mit;
  };
})
