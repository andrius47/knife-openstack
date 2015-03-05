#
# Author:: Prabhu Das (<prabhu.das@clogeny.com>)
# Author:: Ameya Varade (<ameya.varade@clogeny.com>)
# Copyright:: Copyright (c) 2014 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'spec_helper'
require 'chef/knife/openstack_network_list'
require 'chef/knife/cloud/openstack_service'
require 'support/shared_examples_for_command'

describe Chef::Knife::Cloud::OpenstackNetworkList do
  it_behaves_like Chef::Knife::Cloud::Command, Chef::Knife::Cloud::OpenstackNetworkList.new

  let (:instance) {Chef::Knife::Cloud::OpenstackNetworkList.new}

  include_context "#validate!", Chef::Knife::Cloud::OpenstackNetworkList.new

  context "query_resource" do
    it "returns the networks using the fog service." do
      instance.service = double
      expect(instance.service).to receive(:list_networks)
      instance.query_resource
    end
  end
end
