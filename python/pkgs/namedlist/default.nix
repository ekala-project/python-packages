{
  lib,
  buildPythonPackage,
  fetchPypi,
  fetchpatch,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "namedlist";
  version = "1.8";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-NPifyZJZLICzmnCeE27c9B6hfyS6Mer4SjFKAsi5vO8=";
  };

  build-system = [ setuptools ];
  patches = [
    # Deprecation warning using collections.abc, https://gitlab.com/ericvsmith/namedlist/-/merge_requests/1
    (fetchpatch {
      url = "https://gitlab.com/ericvsmith/namedlist/-/commit/102d15b455e6f058b9c95fe135167be82b34c14a.patch";
      hash = "sha256-IfDgiObFFSOUnAlXR/+ye8uutGaFJ/AyQvCb76iNaMM=";
    })
  ];

  # Test file has a `unittest.main()` at the bottom that fails the tests;
  # py.test can run the tests without it.
  postPatch = ''
    substituteInPlace test/test_namedlist.py --replace "unittest.main()" ""
  '';

  pythonImportsCheck = [ "namedlist" ];
  meta = {
    description = "Similar to namedtuple, but instances are mutable";
    homepage = "https://gitlab.com/ericvsmith/namedlist";
    license = lib.licenses.asl20;
  };
})
