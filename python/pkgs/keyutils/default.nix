{
  lib,
  buildPythonPackage,
  cython,
  fetchPypi,
  # build-system
  setuptools,
  pkgs,
}:

buildPythonPackage (finalAttrs: {
  pname = "keyutils";
  version = "0.6";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-qc+6zDOlraFlUx/y1uEkHsk6nwyrxjIF1v9z+O/zN1I=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace setup.py --replace '"pytest-runner"' ""
  '';

  preBuild = ''
    cython keyutils/_keyutils.pyx
  '';

  nativeBuildInputs = [ cython ];

  buildInputs = [ pkgs.keyutils ];

  meta = {
    description = "Set of python bindings for keyutils";
    homepage = "https://github.com/sassoftware/python-keyutils";
    license = lib.licenses.asl20;
  };
})
