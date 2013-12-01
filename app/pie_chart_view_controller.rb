class PieChartViewController < UIViewController
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Pie', image:UIImage.imageNamed('pie_chart.png'), tag:1)
    end
    self
  end

  def viewDidLoad
    super
    @chart_view = UIView.alloc.initWithFrame([[10, 10], [320, 480]])
    @chart_view.backgroundColor = UIColor.whiteColor

    add_chart

    self.view.addSubview(@chart_view)
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    true
  end

  def add_chart

    options = {
      title: {
        text: "Time Required to Make this Sample App Work",
        color: 'FFFFFF',
        font_name: "Arial"
      },
      theme: MotionPlot::Theme.slate,
      data_label: {
        color: "FFFFFF",
        font_size: 10,
        font_name: "Arial",
        displacement: [0, 10]
      },
      legend: {
        enabled: true,
        style: {
          font_name: "Arial",
          font_size: 10,
          color: "FFFFFF"
        },
        # swatch_size: [8.0, 8.0],
        position: "bottom_right",
        displacement: [0.0, 0.0],
        fill_color: "173B0B",
        radius: 4.0,
        number_of_rows: 1,
        number_of_columns: 2
      },
      plot_options: {
        pie: {
          style: {
            gradient: true,
            padding: [5.0, 5.0, 5.0, 5.0],
            plot_area: {
              padding: [5.0, 5.0, 5.0, 5.0],
              mask_to_border: false,
              border_line_style: false
            }
          }
        }
      },
      series: [{
        name: 'Time Allotment',
        data: [
          {
            name: "Debugging",
            y: 79.6
          },
          {
            name: "Installation",
            y: 4.2
          },
          {
            name: "Dependency Resolution",
            y: 1.9
          },
          {
            name: "RTH's Random Modifications",
            y: 14.3
          }
        ]
      }]
    }

    view = MotionPlot::Pie.alloc.initWithOptions(options, containerView:@chart_view)
    @chart_view.addSubview(view)
  end

end
