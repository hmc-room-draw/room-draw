# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'date'
require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module ResourceviewsV1beta2
      
      # The Label to be applied to the resource views.
      class Label
        include Google::Apis::Core::Hashable
      
        # Key of the label.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # Value of the label.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # The list response item that contains the resource and end points information.
      class ListResourceResponseItem
        include Google::Apis::Core::Hashable
      
        # The list of service end points on the resource.
        # Corresponds to the JSON property `endpoints`
        # @return [Hash<String,Array<Fixnum>>]
        attr_accessor :endpoints
      
        # The full URL of the resource.
        # Corresponds to the JSON property `resource`
        # @return [String]
        attr_accessor :resource
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @endpoints = args[:endpoints] if args.key?(:endpoints)
          @resource = args[:resource] if args.key?(:resource)
        end
      end
      
      # An operation resource, used to manage asynchronous API requests.
      class Operation
        include Google::Apis::Core::Hashable
      
        # [Output only] An optional identifier specified by the client when the mutation
        # was initiated. Must be unique for all operation resources in the project.
        # Corresponds to the JSON property `clientOperationId`
        # @return [String]
        attr_accessor :client_operation_id
      
        # [Output Only] The time that this operation was requested, in RFC3339 text
        # format.
        # Corresponds to the JSON property `creationTimestamp`
        # @return [String]
        attr_accessor :creation_timestamp
      
        # [Output Only] The time that this operation was completed, in RFC3339 text
        # format.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # [Output Only] If errors occurred during processing of this operation, this
        # field will be populated.
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::ResourceviewsV1beta2::Operation::Error]
        attr_accessor :error
      
        # [Output only] If operation fails, the HTTP error message returned.
        # Corresponds to the JSON property `httpErrorMessage`
        # @return [String]
        attr_accessor :http_error_message
      
        # [Output only] If operation fails, the HTTP error status code returned.
        # Corresponds to the JSON property `httpErrorStatusCode`
        # @return [Fixnum]
        attr_accessor :http_error_status_code
      
        # [Output Only] Unique identifier for the resource, generated by the server.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # [Output Only] The time that this operation was requested, in RFC3339 text
        # format.
        # Corresponds to the JSON property `insertTime`
        # @return [String]
        attr_accessor :insert_time
      
        # [Output only] Type of the resource.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # [Output Only] Name of the resource.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # [Output only] Type of the operation. Operations include insert, update, and
        # delete.
        # Corresponds to the JSON property `operationType`
        # @return [String]
        attr_accessor :operation_type
      
        # [Output only] An optional progress indicator that ranges from 0 to 100. There
        # is no requirement that this be linear or support any granularity of operations.
        # This should not be used to guess at when the operation will be complete. This
        # number should be monotonically increasing as the operation progresses.
        # Corresponds to the JSON property `progress`
        # @return [Fixnum]
        attr_accessor :progress
      
        # [Output Only] URL of the region where the operation resides. Only available
        # when performing regional operations.
        # Corresponds to the JSON property `region`
        # @return [String]
        attr_accessor :region
      
        # [Output Only] Server-defined fully-qualified URL for this resource.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # [Output Only] The time that this operation was started by the server, in
        # RFC3339 text format.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # [Output Only] Status of the operation.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # [Output Only] An optional textual description of the current status of the
        # operation.
        # Corresponds to the JSON property `statusMessage`
        # @return [String]
        attr_accessor :status_message
      
        # [Output Only] Unique target ID which identifies a particular incarnation of
        # the target.
        # Corresponds to the JSON property `targetId`
        # @return [Fixnum]
        attr_accessor :target_id
      
        # [Output only] URL of the resource the operation is mutating.
        # Corresponds to the JSON property `targetLink`
        # @return [String]
        attr_accessor :target_link
      
        # [Output Only] User who requested the operation, for example: user@example.com.
        # Corresponds to the JSON property `user`
        # @return [String]
        attr_accessor :user
      
        # [Output Only] If there are issues with this operation, a warning is returned.
        # Corresponds to the JSON property `warnings`
        # @return [Array<Google::Apis::ResourceviewsV1beta2::Operation::Warning>]
        attr_accessor :warnings
      
        # [Output Only] URL of the zone where the operation resides. Only available when
        # performing per-zone operations.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_operation_id = args[:client_operation_id] if args.key?(:client_operation_id)
          @creation_timestamp = args[:creation_timestamp] if args.key?(:creation_timestamp)
          @end_time = args[:end_time] if args.key?(:end_time)
          @error = args[:error] if args.key?(:error)
          @http_error_message = args[:http_error_message] if args.key?(:http_error_message)
          @http_error_status_code = args[:http_error_status_code] if args.key?(:http_error_status_code)
          @id = args[:id] if args.key?(:id)
          @insert_time = args[:insert_time] if args.key?(:insert_time)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @operation_type = args[:operation_type] if args.key?(:operation_type)
          @progress = args[:progress] if args.key?(:progress)
          @region = args[:region] if args.key?(:region)
          @self_link = args[:self_link] if args.key?(:self_link)
          @start_time = args[:start_time] if args.key?(:start_time)
          @status = args[:status] if args.key?(:status)
          @status_message = args[:status_message] if args.key?(:status_message)
          @target_id = args[:target_id] if args.key?(:target_id)
          @target_link = args[:target_link] if args.key?(:target_link)
          @user = args[:user] if args.key?(:user)
          @warnings = args[:warnings] if args.key?(:warnings)
          @zone = args[:zone] if args.key?(:zone)
        end
        
        # [Output Only] If errors occurred during processing of this operation, this
        # field will be populated.
        class Error
          include Google::Apis::Core::Hashable
        
          # [Output Only] The array of errors encountered while processing this operation.
          # Corresponds to the JSON property `errors`
          # @return [Array<Google::Apis::ResourceviewsV1beta2::Operation::Error::Error>]
          attr_accessor :errors
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @errors = args[:errors] if args.key?(:errors)
          end
          
          # 
          class Error
            include Google::Apis::Core::Hashable
          
            # [Output Only] The error type identifier for this error.
            # Corresponds to the JSON property `code`
            # @return [String]
            attr_accessor :code
          
            # [Output Only] Indicates the field in the request which caused the error. This
            # property is optional.
            # Corresponds to the JSON property `location`
            # @return [String]
            attr_accessor :location
          
            # [Output Only] An optional, human-readable error message.
            # Corresponds to the JSON property `message`
            # @return [String]
            attr_accessor :message
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @code = args[:code] if args.key?(:code)
              @location = args[:location] if args.key?(:location)
              @message = args[:message] if args.key?(:message)
            end
          end
        end
        
        # 
        class Warning
          include Google::Apis::Core::Hashable
        
          # [Output only] The warning type identifier for this warning.
          # Corresponds to the JSON property `code`
          # @return [String]
          attr_accessor :code
        
          # [Output only] Metadata for this warning in key:value format.
          # Corresponds to the JSON property `data`
          # @return [Array<Google::Apis::ResourceviewsV1beta2::Operation::Warning::Datum>]
          attr_accessor :data
        
          # [Output only] Optional human-readable details for this warning.
          # Corresponds to the JSON property `message`
          # @return [String]
          attr_accessor :message
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @code = args[:code] if args.key?(:code)
            @data = args[:data] if args.key?(:data)
            @message = args[:message] if args.key?(:message)
          end
          
          # 
          class Datum
            include Google::Apis::Core::Hashable
          
            # [Output Only] Metadata key for this warning.
            # Corresponds to the JSON property `key`
            # @return [String]
            attr_accessor :key
          
            # [Output Only] Metadata value for this warning.
            # Corresponds to the JSON property `value`
            # @return [String]
            attr_accessor :value
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @key = args[:key] if args.key?(:key)
              @value = args[:value] if args.key?(:value)
            end
          end
        end
      end
      
      # 
      class OperationList
        include Google::Apis::Core::Hashable
      
        # Unique identifier for the resource; defined by the server (output only).
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The operation resources.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::ResourceviewsV1beta2::Operation>]
        attr_accessor :items
      
        # Type of resource.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # A token used to continue a truncated list request (output only).
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Server defined URL for this resource (output only).
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @self_link = args[:self_link] if args.key?(:self_link)
        end
      end
      
      # The resource view object.
      class ResourceView
        include Google::Apis::Core::Hashable
      
        # The creation time of the resource view.
        # Corresponds to the JSON property `creationTimestamp`
        # @return [String]
        attr_accessor :creation_timestamp
      
        # The detailed description of the resource view.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Services endpoint information.
        # Corresponds to the JSON property `endpoints`
        # @return [Array<Google::Apis::ResourceviewsV1beta2::ServiceEndpoint>]
        attr_accessor :endpoints
      
        # The fingerprint of the service endpoint information.
        # Corresponds to the JSON property `fingerprint`
        # @return [String]
        attr_accessor :fingerprint
      
        # [Output Only] The ID of the resource view.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Type of the resource.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The labels for events.
        # Corresponds to the JSON property `labels`
        # @return [Array<Google::Apis::ResourceviewsV1beta2::Label>]
        attr_accessor :labels
      
        # The name of the resource view.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The URL of a Compute Engine network to which the resources in the view belong.
        # Corresponds to the JSON property `network`
        # @return [String]
        attr_accessor :network
      
        # A list of all resources in the resource view.
        # Corresponds to the JSON property `resources`
        # @return [Array<String>]
        attr_accessor :resources
      
        # [Output Only] A self-link to the resource view.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # The total number of resources in the resource view.
        # Corresponds to the JSON property `size`
        # @return [Fixnum]
        attr_accessor :size
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creation_timestamp = args[:creation_timestamp] if args.key?(:creation_timestamp)
          @description = args[:description] if args.key?(:description)
          @endpoints = args[:endpoints] if args.key?(:endpoints)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @network = args[:network] if args.key?(:network)
          @resources = args[:resources] if args.key?(:resources)
          @self_link = args[:self_link] if args.key?(:self_link)
          @size = args[:size] if args.key?(:size)
        end
      end
      
      # The service endpoint that may be started in a VM.
      class ServiceEndpoint
        include Google::Apis::Core::Hashable
      
        # The name of the service endpoint.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The port of the service endpoint.
        # Corresponds to the JSON property `port`
        # @return [Fixnum]
        attr_accessor :port
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @port = args[:port] if args.key?(:port)
        end
      end
      
      # The request to add resources to the resource view.
      class AddResourcesRequest
        include Google::Apis::Core::Hashable
      
        # The list of resources to be added.
        # Corresponds to the JSON property `resources`
        # @return [Array<String>]
        attr_accessor :resources
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @resources = args[:resources] if args.key?(:resources)
        end
      end
      
      # 
      class GetServiceResponse
        include Google::Apis::Core::Hashable
      
        # The service information.
        # Corresponds to the JSON property `endpoints`
        # @return [Array<Google::Apis::ResourceviewsV1beta2::ServiceEndpoint>]
        attr_accessor :endpoints
      
        # The fingerprint of the service information.
        # Corresponds to the JSON property `fingerprint`
        # @return [String]
        attr_accessor :fingerprint
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @endpoints = args[:endpoints] if args.key?(:endpoints)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
        end
      end
      
      # The response to a list request.
      class ZoneViewsList
        include Google::Apis::Core::Hashable
      
        # The result that contains all resource views that meet the criteria.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::ResourceviewsV1beta2::ResourceView>]
        attr_accessor :items
      
        # Type of resource.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # A token used for pagination.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Server defined URL for this resource (output only).
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @self_link = args[:self_link] if args.key?(:self_link)
        end
      end
      
      # The response to a list resource request.
      class ListResourcesResponse
        include Google::Apis::Core::Hashable
      
        # The formatted JSON that is requested by the user.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::ResourceviewsV1beta2::ListResourceResponseItem>]
        attr_accessor :items
      
        # The URL of a Compute Engine network to which the resources in the view belong.
        # Corresponds to the JSON property `network`
        # @return [String]
        attr_accessor :network
      
        # A token used for pagination.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @network = args[:network] if args.key?(:network)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The request to remove resources from the resource view.
      class RemoveResourcesRequest
        include Google::Apis::Core::Hashable
      
        # The list of resources to be removed.
        # Corresponds to the JSON property `resources`
        # @return [Array<String>]
        attr_accessor :resources
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @resources = args[:resources] if args.key?(:resources)
        end
      end
      
      # 
      class SetServiceRequest
        include Google::Apis::Core::Hashable
      
        # The service information to be updated.
        # Corresponds to the JSON property `endpoints`
        # @return [Array<Google::Apis::ResourceviewsV1beta2::ServiceEndpoint>]
        attr_accessor :endpoints
      
        # Fingerprint of the service information; a hash of the contents. This field is
        # used for optimistic locking when updating the service entries.
        # Corresponds to the JSON property `fingerprint`
        # @return [String]
        attr_accessor :fingerprint
      
        # The name of the resource if user wants to update the service information of
        # the resource.
        # Corresponds to the JSON property `resourceName`
        # @return [String]
        attr_accessor :resource_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @endpoints = args[:endpoints] if args.key?(:endpoints)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @resource_name = args[:resource_name] if args.key?(:resource_name)
        end
      end
    end
  end
end
