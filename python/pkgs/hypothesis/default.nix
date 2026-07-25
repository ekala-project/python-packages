{
  lib,
  buildPythonPackage,
  isPyPy,
  fetchFromGitHub,
  attrs,
  doCheck ? true,
  rustPlatform,
  sortedcontainers,
}:

buildPythonPackage (finalAttrs: {
  pname = "hypothesis";
  version = "6.156.1";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "HypothesisWorks";
    repo = "hypothesis";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Z3LffzA+tsJtvXebTayfRZo32b0LcU2RFDS6bAdCDqU=";
  };

  sourceRoot = "${finalAttrs.src.name}/hypothesis";

  cargoRoot = "rust";
  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs)
      pname
      version
      src
      sourceRoot
      cargoRoot
      ;
    hash = "sha256-WEuCK1jpemnNpO+UxsfpdAkFLSM0v2WRjZr3qmSLBJI=";
  };

  # I tried to package sphinx-selective-exclude, but it throws
  # error about "module 'sphinx' has no attribute 'directives'".
  #
  # It probably has to do with monkey-patching internals of Sphinx.
  # On bright side, this extension does not introduces new commands,
  # only changes "::only" command, so we probably okay with stock
  # implementation.
  #
  # I wonder how upstream of "hypothesis" builds documentation.
  postPatch = ''
    sed -i -e '/sphinx_selective_exclude.eager_only/ d' docs/conf.py
  '';

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
  ];

  build-system = [
    rustPlatform.maturinBuildHook
  ];

  dependencies = [
    attrs
    sortedcontainers
  ];
  inherit doCheck;

  # tox.ini changes how pytest runs and breaks it.
  # Activate the CI profile (similar to setupHook below)
  # by setting HYPOTHESIS_PROFILE [1].
  #
  # [1]: https://github.com/HypothesisWorks/hypothesis/blob/hypothesis-python-6.130.9/hypothesis-python/tests/common/setup.py#L78
  # Hypothesis by default activates several "Health Checks", including one that fires if the builder is "too slow".
  # This check is disabled [1] if Hypothesis detects a CI environment, i.e. either `CI` or `TF_BUILD` is defined [2].
  # We set `CI=1` here using a setup hook to avoid spurious failures [3].
  #
  # Example error message for reference:
  # hypothesis.errors.FailedHealthCheck: Data generation is extremely slow: Only produced 2 valid examples in 1.28 seconds (1 invalid ones and 0 exceeded maximum size). Try decreasing size of the data you're generating (with e.g. max_size or max_leaves parameters).
  #
  # [1]: https://github.com/HypothesisWorks/hypothesis/blob/hypothesis-python-6.130.9/hypothesis-python/src/hypothesis/_settings.py#L816-L828
  # [2]: https://github.com/HypothesisWorks/hypothesis/blob/hypothesis-python-6.130.9/hypothesis-python/src/hypothesis/_settings.py#L756
  # [3]: https://github.com/NixOS/nixpkgs/issues/393637
  setupHook = ./setup-hook.sh;
  pythonImportsCheck = [ "hypothesis" ];

  meta = {
    description = "Library for property based testing";
    mainProgram = "hypothesis";
    homepage = "https://github.com/HypothesisWorks/hypothesis";
    license = lib.licenses.mpl20;
    maintainers = [
      lib.maintainers.fliegendewurst
    ];
  };
})
