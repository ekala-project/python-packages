{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  build,
}:

buildPythonPackage rec {
  pname = "inotify";
  version = "0.2.12";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-mu5Af5LH1Ros5Q87eCkakJTjNONL1o6Cv2ACB5X6LJQ=";
  };

  build-system = [ setuptools ];

  dependencies = [ build ];

  pythonImportsCheck = [ "inotify" ];

  meta = {
    description = "Monitor filesystems events on Linux platforms with inotify";
    homepage = "https://github.com/dsoprea/PyInotify";
    license = lib.licenses.gpl2Only;
    platforms = lib.platforms.linux;
  };
}
