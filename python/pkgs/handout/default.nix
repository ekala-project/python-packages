{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  imageio,
  imageio-ffmpeg,
}:

buildPythonPackage (finalAttrs: {
  pname = "handout";
  version = "1.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "52daaf1f9a4cb2ceb88c1dedf85d22ef449b9422b424a2534d21f941e57bc915";
  };

  build-system = [ setuptools ];

  dependencies = [
    imageio
    imageio-ffmpeg
  ];

  meta = {
    description = "Turn Python scripts into handouts with Markdown and figures";
    homepage = "https://github.com/danijar/handout";
    license = lib.licenses.gpl3;
  };
})
