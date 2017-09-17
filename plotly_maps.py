
postmates_deliveries = pd.read_csv('/Users/stevengarboden/Desktop/analyze_me.csv')



analyze_me['how_long_it_took_to_order'] = \
    analyze_me['how_long_it_took_to_order'].str.split('.').str[0]

analyze_me['when_the_delivery_started'] = \
    analyze_me['when_the_delivery_started'].str.split('.').str[0]


analyze_me['when_the_Jumpman_arrived_at_pickup'] = \
    analyze_me['when_the_Jumpman_arrived_at_pickup'].str.split('.').str[0] ###2014-10-16 22:48:23.091253


analyze_me['when_the_Jumpman_left_pickup'] = \
    analyze_me['when_the_Jumpman_left_pickup'].str.split('.').str[0]



pickup_lat_list = postmates_deliveries.pickup_lat.tolist()
pickup_lng_list = postmates_deliveries.pickup_lon.tolist()
postmates_deliveries
dropoff_lat_list = postmates_deliveries.dropoff_lat.tolist()
dropoff_lng_list = postmates_deliveries.dropoff_lon.tolist()


import plotly 
### https://plot.ly/python/scattermapbox/
### finding colors is hard? 


api_key_plotly = creds.PLOTLY['api_key']
username_plotly = creds.PLOTLY['username']

plotly.tools.set_credentials_file(username= username_plotly, api_key=api_key_plotly)
plotly.tools.set_config_file(world_readable=False,  ###set graph to private
                             sharing='private')

import plotly.plotly as py
from plotly.graph_objs import *

mapbox_access_token = 'pk.eyJ1IjoiZ2FyYm9uem8iLCJhIjoiY2o2ZmV1cTJyMGdrdDMzbzYzaDh6ZW42eCJ9.W4ZqVFNAZQmAE09HwY3d9w'


data = Data([
    Scattermapbox(
        lat= pickup_lat_list,
        lon= pickup_lng_list,
        
        mode='markers',
        marker=Marker(
            color= 'rgb(79, 161, 69)',
            size=6,
            opacity=0.9
        ),
        
    ),
    Scattermapbox(
        lat=dropoff_lat_list,
        lon=dropoff_lng_list,
        mode='markers',
        marker=Marker(
            size=4,
            color='rgb(255, 0, 0)',
            opacity=0.9
        ),
        
    )
])
layout = Layout(
    autosize=True,
    hovermode='closest',
    mapbox=dict(
        accesstoken=mapbox_access_token,
        bearing=0,
        center=dict(
            lat=40.7,
            lon=-73.9
        ),
        pitch=0,
        zoom=10
    ),
)

fig = dict(data=data, layout=layout)
py.iplot(fig, filename='Postmates_Geo')

