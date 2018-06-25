/* Copyright (c) 2018 PaddlePaddle Authors. All Rights Reserved.
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License. */

import Foundation

struct ConvParam<P: PrecisionType>: Param {
    typealias ParamP = P
    init(opDesc: OpDesc, scope: Scope) throws {
        do {
            filter = try ConvParam.inputFilter(paraInputs: opDesc.paraInputs, from: scope)
            input = try ConvParam.input(inputs: opDesc.inputs, from: scope)
            output = try ConvParam.output(outputs: opDesc.outputs, from: scope)
            stride = try ConvParam.getAttr(key: "stride", attrs: opDesc.attrs)
            paddings = try ConvParam.getAttr(key: "paddings", attrs: opDesc.attrs)
            dilations = try ConvParam.getAttr(key: "dilations", attrs: opDesc.attrs)
            groups = try ConvParam.getAttr(key: "groups", attrs: opDesc.attrs)
        } catch let error {
            throw error
        }
    }
    
    let input: Tensor<ParamP>
    let output: Tensor<ParamP>
    let filter: Tensor<ParamP>
    let stride: [Int]
    let paddings: [Int]
    let dilations: [Int]
    let groups: Int
}

class ConvOp<P: PrecisionType>: Operator<ConvParam<P>> {
    override func runImpl() {
        
    }
}
