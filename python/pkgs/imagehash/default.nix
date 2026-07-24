{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  numpy,
  pillow,
  pywavelets,
  scipy,
  setuptools,
}:

buildPythonPackage rec {
  pname = "imagehash";
  version = "4.3.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "JohannesBuchner";
    repo = "imagehash";
    tag = "v${version}";
    hash = "sha256-/kYINT26ROlB3fIcyyR79nHKg9FsJRQsXQx0Bvl14ec=";
  };

  build-system = [ setuptools ];

  dependencies = [
    numpy
    scipy
    pillow
    pywavelets
  ];
  pythonImportsCheck = [ "imagehash" ];

  meta = {
    description = "Python Perceptual Image Hashing Module";
    homepage = "https://github.com/JohannesBuchner/imagehash";
    license = lib.licenses.bsd2;
    maintainers = [ ];
    mainProgram = "find_similar_images.py";
  };
}
