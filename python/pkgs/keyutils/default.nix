{
  lib,
  buildPythonPackage,
  cython,
  fetchFromGitHub,
  # build-system
  setuptools,
  keyutils,
}:

buildPythonPackage (finalAttrs: {
  pname = "keyutils";
  version = "0.6";
  pyproject = true;

  # github version comes bundled with tests
  src = fetchFromGitHub {
    owner = "sassoftware";
    repo = "python-keyutils";
    tag = finalAttrs.version;
    sha256 = "0pfqfr5xqgsqkxzrmj8xl2glyl4nbq0irs0k6ik7iy3gd3mxf5g1";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace setup.py --replace '"pytest-runner"' ""
  '';

  preBuild = ''
    cython keyutils/_keyutils.pyx
  '';

  nativeBuildInputs = [ cython ];

  meta = {
    description = "Set of python bindings for keyutils";
    homepage = "https://github.com/sassoftware/python-keyutils";
    license = lib.licenses.asl20;
  };
})
