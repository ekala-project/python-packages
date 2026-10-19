{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pycayennelpp";
  version = "2.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "1cc6lz28aa57gs74767xyd3i370lwx046yb5a1nfch6fk3kf7xdx";
  };

  build-system = [ setuptools ];

  # Patch setup.py to remove pytest-runner
  postPatch = ''
    substituteInPlace setup.py \
      --replace '"pytest-runner"' ""
  '';

  meta = {
    description = "Python library for Cayenne Low Power Payload";
    homepage = "https://github.com/smlng/pycayennelpp";
    license = lib.licenses.mit;
  };
})
