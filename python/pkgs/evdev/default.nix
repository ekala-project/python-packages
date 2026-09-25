{
  lib,
  buildPythonPackage,
  fetchPypi,
  linuxHeaders,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "evdev";
  version = "2.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-RC+z9MjfyeYekBEzw1YiDALWY+yo80ci4M7N1jfrpQQ=";
  };

  patchPhase = ''
    substituteInPlace setup.py \
      --replace-fail /usr/include ${linuxHeaders}/include
  '';

  build-system = [ setuptools ];

  buildInputs = [ linuxHeaders ];

  pythonImportsCheck = [ "evdev" ];

  meta = {
    description = "Provides bindings to the generic input event interface in Linux";
    homepage = "https://python-evdev.readthedocs.io/";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.linux;
  };
})
