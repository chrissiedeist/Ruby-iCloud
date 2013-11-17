require 'protocol_buffers'
module RubyiCloud
  module ProtocolBuffers
    class BackupDevices < ::ProtocolBuffers::Message
      required :string, :psid, 1
      repeated :hex, :udids, 2 # custom type
      optional :bool, :todo, 3 # TODO: figure out meaning of this boolean
    end
    
    class DeviceInfo < ::ProtocolBuffers::Message
      required :string, :name, 1
      required :string, :version, 2
      required :string, :build, 3
      required :int32, :unknown1, 4
      required :hex, :unknown, 5
      required :int32, :unknown2, 6
      required :int32, :unknown3, 7
    end
    
    class Backup < ::ProtocolBuffers::Message
      required :int32, :index, 1
      required :int64, :size, 2
      required :timestamp, :timestamp, 3
      required ::RubyiCloud::ProtocolBuffers::DeviceInfo, :device_info, 5
      required :timestamp, :timestamp2, 6
    end
    
    class DeviceType < ::ProtocolBuffers::Message
      required :string, :name, 1
      required :string, :version, 2
      required :string, :serial_number, 3
      required :string, :variant, 4
      required :string, :model, 5
      required :string, :full_name, 6
      required :string, :unknown, 7
    end
    
    class Backups < ::ProtocolBuffers::Message
      required :hex, :udid, 1
      required :int64, :total_size, 2
      repeated ::RubyiCloud::ProtocolBuffers::Backup, :backup, 3
      required ::RubyiCloud::ProtocolBuffers::DeviceType, :device_type, 4
      required :timestamp, :creation_time, 5
    end
    
    ## /mbs/$dsid$/$udid$/$id$/listFiles
    # length = Varint.decode(io)
    # file = File.parse(io.read(length))
    
    class FileAttribute < ::ProtocolBuffers::Message
      required :string, :name, 1
      required :bytes, :value, 2 
    end
    
    class FileInfo < ::ProtocolBuffers::Message
      required :int32, :unknown1, 1
      required :string, :unknown2, 2
      required :bytes, :unknown3, 3
      required :int32, :unknown4, 4
      required :int32, :unknown5, 5
      required :int32, :unknown6, 6
      required :int32, :unknown7, 7
      required :timestamp, :mtime, 8
      required :timestamp, :atime, 9
      required :timestamp, :ctime, 10
      required :int32, :unknown8, 12
      repeated ::RubyiCloud::ProtocolBuffers::FileAttribute, :attributes, 13
      required :int32, :unknown9, 14
      required :int32, :unknown10, 15
    end
    
    
    class File < ::ProtocolBuffers::Message
      required :hex, :hex1, 1
      required :string, :domain, 2
      required :string, :path, 3
      optional :hex, :hex2, 4
      required :int32, :unknown, 5
      required ::RubyiCloud::ProtocolBuffers::FileInfo, :fileinfo, 6
      required :timestamp, :date, 7
      required :bool, :bool, 9
    end
    
  end
end
