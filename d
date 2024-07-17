'use client';

import { useEffect, useState, SyntheticEvent } from 'react';
import { useTheme } from '@mui/material/styles';
import Tab from '@mui/material/Tab';
import Box from '@mui/material/Box';
import Tabs from '@mui/material/Tabs';
import Grid from '@mui/material/Grid';
import List from '@mui/material/List';
import Stack from '@mui/material/Stack';
import ListItem from '@mui/material/ListItem';
import MenuItem from '@mui/material/MenuItem';
import Typography from '@mui/material/Typography';
import FormControl from '@mui/material/FormControl';
import ListItemText from '@mui/material/ListItemText';
import ListItemAvatar from '@mui/material/ListItemAvatar';
import Select, { SelectChangeEvent } from '@mui/material/Select';
import ReactApexChart, { Props as ChartProps } from 'react-apexcharts';
import { Avatar, IconButton } from '@mui/material';
import { ArrowDown, ArrowSwapHorizontal, ArrowUp, Bookmark, Chart, Edit, HomeTrendUp, Maximize4, ShoppingCart } from 'iconsax-react';

enum ThemeMode {
  LIGHT = 'light',
  DARK = 'dark',
  AUTO = 'auto'
}

const MoreIcon = () => {
  return (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width="24"
      height="24"
      viewBox="0 0 24 24"
      strokeWidth="2"
      stroke="currentColor"
      fill="none"
      strokeLinecap="round"
      strokeLinejoin="round"
    >
      <path stroke="none" d="M0 0h24v24H0z" fill="none" />
      <path d="M12 12m-1 0a1 1 0 1 0 2 0a1 1 0 1 0 -2 0" />
      <path d="M12 19m-1 0a1 1 0 1 0 2 0a1 1 0 1 0 -2 0" />
      <path d="M12 5m-1 0a1 1 0 1 0 2 0a1 1 0 1 0 -2 0" />
    </svg>
  );
};

function a11yProps(index: number) {
  return {
    id: `simple-tab-${index}`,
    'aria-controls': `simple-tabpanel-${index}`
  };
}

const CaregiverDataChart = ({ data }: { data: any[] }) => {
  const theme = useTheme();
  const mode = theme.palette.mode;

  const areaChartOptions = {
    chart: {
      type: 'bar',
      toolbar: {
        show: false
      }
    },
    plotOptions: {
      bar: {
        horizontal: false,
        columnWidth: '55%',
        borderRadius: 4
      }
    },
    legend: {
      show: true,
      position: 'top',
      horizontalAlign: 'left'
    },
    dataLabels: {
      enabled: false
    },
    stroke: {
      show: true,
      width: 2,
      colors: ['transparent']
    },
    fill: {
      opacity: 1
    },
    grid: {
      strokeDashArray: 4
    },
    tooltip: {
      y: {
        formatter: (val: number) => val.toString()
      }
    }
  };

  const { primary, secondary } = theme.palette.text;
  const line = theme.palette.divider;

  const [options, setOptions] = useState<ChartProps>(areaChartOptions);

  useEffect(() => {
    setOptions((prevState) => ({
      ...prevState,
      colors: [theme.palette.primary.main, theme.palette.secondary.main, theme.palette.success.main],
      xaxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
        labels: {
          style: {
            colors: Array(7).fill(secondary)
          }
        },
        axisBorder: {
          show: false,
          color: line
        },
        axisTicks: {
          show: false
        },
        tickAmount: 6
      },
      yaxis: {
        labels: {
          style: {
            colors: [secondary]
          }
        }
      },
      grid: {
        borderColor: line
      },
      legend: {
        labels: {
          colors: secondary
        }
      },
      theme: {
        mode: mode === ThemeMode.DARK ? 'dark' : 'light'
      }
    }));
  }, [mode, primary, secondary, line, theme]);

  const [series, setSeries] = useState(data);

  useEffect(() => {
    setSeries(data);
  }, [data]);

  return <ReactApexChart options={options} series={series} type="bar" height={250} />;
};

export default function CaregiverAnalytics() {
  const [value, setValue] = useState(0);
  const [timeframe, setTimeframe] = useState('30');

  const chartData = [
    [
      {
        name: 'Symptom Severity',
        data: [5, 6, 5, 7, 6, 8, 6]
      },
      {
        name: 'Medication Adherence',
        data: [90, 92, 85, 88, 91, 89, 94]
      },
      {
        name: 'Activity Levels',
        data: [60, 65, 62, 70, 68, 75, 72]
      }
    ],
    [
      {
        name: 'Symptom Severity',
        data: [4, 5, 6, 6, 5, 7, 5]
      },
      {
        name: 'Medication Adherence',
        data: [88, 89, 87, 86, 90, 92, 93]
      },
      {
        name: 'Activity Levels',
        data: [65, 70, 67, 68, 70, 75, 73]
      }
    ]
  ];

  const [data, setData] = useState(chartData[0]);

  const handleChangeSelect = (event: SelectChangeEvent) => {
    setTimeframe(event.target.value as string);
  };

  const handleChange = (event: SyntheticEvent, newValue: number) => {
    setValue(newValue);
    setData(chartData[newValue]);
  };

  return (
    <Box sx={{ p: 2, m: 2, border: '1px solid #e0e0e0', borderRadius: '8px' }}>
      <Box sx={{ width: '100%' }}>
        <Box sx={{ borderBottom: 1, borderColor: 'divider' }}>
          <Tabs value={value} onChange={handleChange} aria-label="basic tabs example" sx={{ px: 3, pt: 1, '& .MuiTab-root': { mb: 0.5 } }}>
            <Tab label="Weekly" {...a11yProps(0)} />
            <Tab label="Monthly" {...a11yProps(1)} />
          </Tabs>
        </Box>
        <Box sx={{ p: 3 }}>
          <Grid container spacing={2}>
            <Grid item xs={12} md={8}>
              <Stack spacing={2}>
                <Stack direction="row" alignItems="center" justifyContent="flex-end" spacing={1}>
                  <Box sx={{ minWidth: 120 }}>
                    <FormControl fullWidth>
                      <Select id="demo-simple-select" value={timeframe} onChange={handleChangeSelect}>
                        <MenuItem value={10}>Today</MenuItem>
                        <MenuItem value={20}>Weekly</MenuItem>
                        <MenuItem value={30}>Monthly</MenuItem>
                      </Select>
                    </FormControl>
                  </Box>
                  <IconButton color="secondary" sx={{ color: 'text.secondary' }}>
                    <Edit />
                  </IconButton>
                  <IconButton color="secondary" sx={{ color: 'text.secondary' }}>
                    <Maximize4 />
                  </IconButton>
                  <IconButton color="secondary" sx={{ transform: 'rotate(90deg)', color: 'text.secondary' }}>
                    <MoreIcon />
                  </IconButton>
                </Stack>
                <CaregiverDataChart data={data} />
              </Stack>
            </Grid>
            <Grid item xs={12} md={4}>
              <List disablePadding sx={{ '& .MuiListItem-root': { px: 3, py: 1.5 } }}>
                <ListItem
                  divider
                  secondaryAction={
                    <Stack spacing={0.25} alignItems="flex-end">
                      <Typography variant="subtitle1">5</Typography>
                      <Typography color="error" sx={{ display: 'flex', alignItems: 'center', gap: 0.5 }}>
                        <ArrowDown style={{ transform: 'rotate(45deg)' }} size={14} /> 10.6%
                      </Typography>
                    </Stack>
                  }
                >
                  <ListItemAvatar>
                    <Avatar variant="rounded" color="secondary" sx={{ color: 'text.secondary' }} />
                      <Chart />
                    </ListItemAvatar>
                  <ListItemText
                    primary={<Typography color="text.secondary">Symptom Severity</Typography>}
                    secondary={<Typography variant="subtitle1">5</Typography>}
                  />
                </ListItem>
                <ListItem
                  divider
                  secondaryAction={
                    <Stack spacing={0.25} alignItems="flex-end">
                      <Typography variant="subtitle1">+7</Typography>
                      <Typography color="success.main" sx={{ display: 'flex', alignItems: 'center', gap: 0.5 }}>
                        <ArrowUp style={{ transform: 'rotate(45deg)' }} size={14} /> 30.6%
                      </Typography>
                    </Stack>
                  }
                >
                  <ListItemAvatar>
                    <Avatar variant="rounded" color="secondary" sx={{ color: 'text.secondary' }}>
                      <HomeTrendUp />
                    </Avatar>
                  </ListItemAvatar>
                  <ListItemText
                    primary={<Typography color="text.secondary">Medication Adherence</Typography>}
                    secondary={<Typography variant="subtitle1">90%</Typography>}
                  />
                </ListItem>
                <ListItem
                  secondaryAction={
                    <Stack spacing={0.25} alignItems="flex-end">
                      <Typography variant="subtitle1">+72</Typography>
                      <Typography color="success.main" sx={{ display: 'flex', alignItems: 'center', gap: 0.5 }}>
                        <ArrowUp style={{ transform: 'rotate(45deg)' }} size={14} /> 5%
                      </Typography>
                    </Stack>
                  }
                >
                  <ListItemAvatar>
                    <Avatar variant="rounded" color="secondary" sx={{ color: 'text.secondary' }}>
                      <ShoppingCart />
                    </Avatar>
                  </ListItemAvatar>
                  <ListItemText
                    primary={<Typography color="text.secondary">Activity Levels</Typography>}
                    secondary={<Typography variant="subtitle1">72</Typography>}
                  />
                </ListItem>
              </List>
            </Grid>
          </Grid>
        </Box>
      </Box>
    </Box>
  );
}
