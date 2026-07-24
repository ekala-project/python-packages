{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  cython,
  setuptools,

  # nativeBuildInputs
  pkg-config,

  # buildInputs
  ffmpeg-headless,

  # dependencies

  fetchurl,
  linkFarm,
  numpy,
  pillow,
}:

buildPythonPackage (finalAttrs: {
  pname = "av";
  version = "17.0.1";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "PyAV-Org";
    repo = "PyAV";
    tag = "v${finalAttrs.version}";
    hash = "sha256-IS+qSwvpNbhOazkgZh9hzzaTLxSgU7uZjGmaOIkhskc=";
  };

  build-system = [
    cython
    setuptools
  ];

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ ffmpeg-headless ];

  preCheck =
    let
      # Update with `./update-test-samples.bash` if necessary.
      testSamples = linkFarm "pyav-test-samples" (
        lib.mapAttrs (_: fetchurl) (lib.importTOML ./test-samples.toml)
      );
    in
    ''
      # ensure we import the built version
      rm -r av
      ln -s ${testSamples} tests/assets
    '';
  pythonImportsCheck = [
    "av"
    "av.audio"
    "av.buffer"
    "av.codec"
    "av.container"
    "av._core"
    "av.datasets"
    "av.descriptor"
    "av.dictionary"
    "av.error"
    "av.filter"
    "av.format"
    "av.frame"
    "av.logging"
    "av.option"
    "av.packet"
    "av.plane"
    "av.stream"
    "av.subtitles"
    "av.utils"
    "av.video"
  ];

  meta = {
    description = "Pythonic bindings for FFmpeg";
    mainProgram = "pyav";
    homepage = "https://github.com/PyAV-Org/PyAV";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
})
