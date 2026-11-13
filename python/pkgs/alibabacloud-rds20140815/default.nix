{
  lib,
  alibabacloud-gateway-pop,
  alibabacloud-tea-openapi,
  buildPythonPackage,
  darabonba-core,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "alibabacloud-rds20140815";
  version = "16.1.4";
  pyproject = true;

  src = fetchPypi {
    pname = "alibabacloud_rds20140815";
    inherit (finalAttrs) version;
    hash = "sha256-9vPOedmjTmDWZbozbzFOLdmh1dLP6/UIjVf5YOxphs4=";
  };

  build-system = [ setuptools ];

  dependencies = [
    alibabacloud-gateway-pop
    alibabacloud-tea-openapi
    darabonba-core
  ];

  pythonImportsCheck = [ "alibabacloud_rds20140815" ];

  # Module has no tests

  meta = {
    description = "Alibaba Cloud rds (20140815) SDK Library for Python";
    homepage = "https://pypi.org/project/alibabacloud-rds20140815/";
    license = lib.licenses.asl20;
  };
})
