{
  buildPythonPackage,
  pkgs,
  pkg-config,
  # build-system
  setuptools,
}:

let
  sentencepiece-cpp = pkgs.sentencepiece;
in
buildPythonPackage rec {
  pname = "sentencepiece";
  pyproject = true;
  inherit (sentencepiece-cpp) version src;

  build-system = [ setuptools ];

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ sentencepiece-cpp.dev ];

  sourceRoot = "${src.name}/python";

  pythonImportsCheck = [ "sentencepiece" ];

  # sentencepiece installs 'bin' output.
  meta = removeAttrs sentencepiece-cpp.meta [ "outputsToInstall" ];
}
