# automatically generated by the FlatBuffers compiler, do not modify

# namespace: DebugFB

import flatbuffers


class Float(object):
    __slots__ = ["_tab"]

    @classmethod
    def GetRootAsFloat(cls, buf, offset):
        n = flatbuffers.encode.Get(flatbuffers.packer.uoffset, buf, offset)
        x = Float()
        x.Init(buf, n + offset)
        return x

    # Float
    def Init(self, buf, pos):
        self._tab = flatbuffers.table.Table(buf, pos)

    # Float
    def Val(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(4))
        if o != 0:
            return self._tab.Get(
                flatbuffers.number_types.Float32Flags, o + self._tab.Pos
            )
        return 0.0


def FloatStart(builder):
    builder.StartObject(1)


def FloatAddVal(builder, val):
    builder.PrependFloat32Slot(0, val, 0.0)


def FloatEnd(builder):
    return builder.EndObject()
