{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "pyvcd";
  version = "0.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-luPHuUCeY/WOtLXCKwF/nzQS3b38c0zsLh361cKag98=";
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
    changelog = "https://github.com/SanDisk-Open-Source/pyvcd/blob/${version}/CHANGELOG.rst";
    license = lib.licenses.mit;
  };
}
