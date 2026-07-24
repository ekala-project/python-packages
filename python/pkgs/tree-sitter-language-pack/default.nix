{
  lib,
  buildPackages,
  buildPythonPackage,
  fetchFromGitHub,
  fetchurl,
  python,
  rustPlatform,
  stdenv,
  tree-sitter,
}:

let
  parserReleaseUrl =
    version: "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v${version}";

  parserBundleSpecs = {
    aarch64-darwin = {
      suffix = "macos-arm64";
      hash = "sha256-pYrgwhb3BkOEqot5JBi26aXBciGt7/zP/1+HcQT2vsw=";
    };
    aarch64-linux = {
      suffix = "linux-aarch64";
      hash = "sha256-t1rWm19iExYAZXluMQqlt9bOkEC2UumcxDov8YmYEEQ=";
    };
    x86_64-linux = {
      suffix = "linux-x86_64";
      hash = "sha256-o4IpLZDitTsHfF2KMnyB3Wry7Hig7Byxd0JLcZPybJ0=";
    };
  };
in
buildPythonPackage (finalAttrs: {
  pname = "tree-sitter-language-pack";
  pyproject = true;
  version = "1.4.1";

  src = fetchFromGitHub {
    owner = "kreuzberg-dev";
    repo = "tree-sitter-language-pack";
    tag = "v${finalAttrs.version}";
    hash = "sha256-kN2htitEOo+JF6DCrC4RHmHkZXnUA0fUo2jSbMELQHI=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs)
      pname
      version
      src
      ;
    hash = "sha256-ii3rvAfs4xMSyEEDjUrjL2SAONd0ARCVhwQNCJLwuCk=";
  };

  buildAndTestSubdir = "crates/ts-pack-python";

  # Pin the release metadata and per-platform parser archive so runtime use stays offline.
  parserManifest = fetchurl {
    url = "${parserReleaseUrl finalAttrs.version}/parsers.json";
    hash = "sha256-8utASonvrLzOjxZcmRuzuFSGtYe5sEoMU+xz++bfmkk=";
  };

  parserBundle =
    let
      spec =
        parserBundleSpecs.${stdenv.hostPlatform.system}
          or (throw "tree-sitter-language-pack parser bundle is unavailable for ${stdenv.hostPlatform.system}");
    in
    fetchurl {
      url = "${parserReleaseUrl finalAttrs.version}/parsers-${spec.suffix}.tar.zst";
      inherit (spec) hash;
    };

  nativeBuildInputs = [
    buildPackages.zstd
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
  ];
  dependencies = [ tree-sitter ];
  postInstall = ''
    cacheRoot=$out/share/tree-sitter-language-pack
    cacheDir="$cacheRoot/libs"
    mkdir -p "$cacheDir"
    cp ${finalAttrs.parserManifest} "$cacheRoot/manifest.json"
    ${lib.getExe buildPackages.zstd} -d -c ${finalAttrs.parserBundle} | tar -xvf - -C "$cacheDir" >/dev/null

    # Make the installed package default to the pre-fetched cache in $out.
    substituteInPlace $out/${python.sitePackages}/tree_sitter_language_pack/__init__.py \
      --replace-fail 'SupportedLanguage: TypeAlias = str' $'configure(cache_dir="'$cacheDir$'")\n\nSupportedLanguage: TypeAlias = str'
  '';

  pythonImportsCheck = [ "tree_sitter_language_pack" ];

  passthru.updateScript = ./update.sh;

  meta = {
    description = "Comprehensive collection of tree-sitter language parsers with polyglot bindings";
    homepage = "https://github.com/kreuzberg-dev/tree-sitter-language-pack";
    license = lib.licenses.mit;
    maintainers = [ ];
    platforms = builtins.attrNames parserBundleSpecs;
  };
})
