{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  decorator,
  imageio,
  imageio-ffmpeg,
  numpy,
  proglog,
  python-dotenv,
  requests,
  tqdm,
}:

buildPythonPackage rec {
  pname = "moviepy";
  version = "2.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Zulko";
    repo = "moviepy";
    tag = "v${version}";
    hash = "sha256-3vt/EyEOv6yNPgewkgcWcjM0TbQ6IfkR6nytS/WpRyg=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "pillow" ];

  dependencies = [
    decorator
    imageio
    imageio-ffmpeg
    numpy
    proglog
    python-dotenv
    requests
    tqdm
  ];
  # See https://github.com/NixOS/nixpkgs/issues/381908 and https://github.com/NixOS/nixpkgs/issues/385450.
  pythonImportsCheck = [ "moviepy" ];
  meta = {
    description = "Video editing with Python";
    homepage = "https://zulko.github.io/moviepy/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
