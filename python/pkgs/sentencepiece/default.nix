{
  buildPythonPackage,
  pkgs,
  pkg-config,
  # build-system
  pybind11,
  setuptools,
}:

let
  sentencepiece-cpp = pkgs.sentencepiece;
  abseil-cpp = sentencepiece-cpp.abseil-cpp;
in
buildPythonPackage (finalAttrs: {
  pname = "sentencepiece";
  pyproject = true;
  inherit (sentencepiece-cpp) version src;

  # setup.py looks for a prebuilt static sentencepiece under ../build/root and
  # otherwise runs build_bundled.sh, which downloads abseil. Point it at the
  # Nix-built libraries, and link the shared abseil libraries.
  postPatch = ''
    substituteInPlace setup.py \
      --replace-fail "find_abseil_lib('../build/third_party')" "find_abseil_lib('${abseil-cpp}/lib')" \
      --replace-fail "ext = '.lib' if os.name == 'nt' else '.a'" "ext = '.lib' if os.name == 'nt' else '.so'"
  '';

  preBuild = ''
    chmod u+w ..
    mkdir -p ../build/root
    ln -s ${sentencepiece-cpp.dev}/include ../build/root/include
    ln -s ${sentencepiece-cpp.out}/lib ../build/root/lib
  '';

  build-system = [
    pybind11
    setuptools
  ];

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [
    abseil-cpp
    sentencepiece-cpp.dev
  ];

  sourceRoot = "${finalAttrs.src.name}/python";

  pythonImportsCheck = [ "sentencepiece" ];

  # sentencepiece installs 'bin' output.
  meta = removeAttrs sentencepiece-cpp.meta [ "outputsToInstall" ];
})
